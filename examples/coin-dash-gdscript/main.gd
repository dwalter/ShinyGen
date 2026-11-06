extends Node2D

# Coin Dash: steer the square, collect coins before the timer runs out.

const W = 960.0
const H = 540.0
const SPEED = 320.0
const COIN_COUNT = 8
const ROUND_TIME = 30.0

var player: ColorRect
var coins = []
var label: Label
var score = 0
var time_left = ROUND_TIME
var over = false
var shown_seconds = -1

func _ready():
    get_parent().set_design_size(960, 540)
    get_parent().set_virtual_controls({"stick": true})

    var bg = ColorRect.new()
    bg.color = Color(0.08, 0.10, 0.16)
    bg.size = Vector2(W, H)
    add_child(bg)

    for i in range(COIN_COUNT):
        var coin = ColorRect.new()
        coin.color = Color(1.0, 0.85, 0.2)
        coin.size = Vector2(22, 22)
        place_coin(coin)
        add_child(coin)
        coins.append(coin)

    player = ColorRect.new()
    player.color = Color(0.95, 0.45, 0.15)
    player.size = Vector2(36, 36)
    player.position = Vector2(W * 0.5 - 18.0, H * 0.5 - 18.0)
    add_child(player)

    label = Label.new()
    label.position = Vector2(16, 12)
    add_child(label)

    refresh()
    print("[coin_dash] ready")

func place_coin(coin):
    coin.position = Vector2(randf_range(20.0, W - 42.0), randf_range(60.0, H - 42.0))

func refresh():
    if over:
        label.text = "Time up!  Score: " + str(score)
    else:
        label.text = "Score: " + str(score) + "   Time: " + str(int(time_left))
    get_parent().report_status({"phase": "over" if over else "playing", "score": score})

func overlaps(a, b):
    return a.position.x < b.position.x + b.size.x and a.position.x + a.size.x > b.position.x and a.position.y < b.position.y + b.size.y and a.position.y + a.size.y > b.position.y

func _process(delta):
    if over:
        return

    var v = Input.get_vector("move_left", "move_right", "move_up", "move_down")
    player.position += v * SPEED * delta
    player.position.x = clamp(player.position.x, 0.0, W - player.size.x)
    player.position.y = clamp(player.position.y, 0.0, H - player.size.y)

    for coin in coins:
        if overlaps(player, coin):
            score += 1
            place_coin(coin)
            refresh()

    time_left -= delta
    if int(time_left) != shown_seconds:
        shown_seconds = int(time_left)
        refresh()
    if time_left <= 0.0:
        time_left = 0.0
        over = true
        refresh()
