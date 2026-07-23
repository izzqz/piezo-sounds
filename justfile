# https://just.systems

CUBIC_BETA := "0.3"

ffmpeg_params := "-hide_banner -loglevel warning -ch_layout mono"

ref := env_var_or_default('GITHUB_REF_NAME', env_var_or_default('GITHUB_SHA', 'local'))

_default:
    @just --list

# check if deps installed
precheck:
    command -v beep
    command -v git
    command -v cc
    command -v ffmpeg
    command -v zip
    ffmpeg -encoders 2>/dev/null | grep -q libopus
    ffmpeg -encoders 2>/dev/null | grep -q libvorbis
    ffmpeg -encoders 2>/dev/null | grep -q libmp3lame

# build everything properly
[working-directory: 'out']
build: precheck prepare generate convert
    echo "piezo sounds {{ref}}" > readme.txt
    zip -r ../piezo_sounds.zip .

# fetch submodule and build tool
prepare:
    git submodule update --init
    @just --justfile beep2wav/justfile build
    mkdir -p out/wav
    mkdir -p out/ogg
    mkdir -p out/opus
    mkdir -p out/mp3

# execute beep2wav with filename
put name *command:
    ./beep2wav/beep2wav -o ./out/wav/{{ name }}.wav --cubic-beta {{ CUBIC_BETA }} -- {{ command }}

# TODO: extract this as different file
generate: prepare
    just put lookup beep -f 1093 -l 50 -n -f 865 -l 50 -n -f 1093 -l 50 -n -f 1637 -l 100
    just put done beep -f 2077 -l 80 -n -f 3077 -l 80
    just put awake beep -f 1000 -l 300 -n -f 1500 -r 4 -l 10 -n -f 2000 -l 80;
    just put ringing_high beep -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                            -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70
    just put ringing_mid beep -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                            -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200
    just put ping beep -f 2200 -l 70 -D 90 -n -f 2800 -l 55
    just put discord_call beep -n -f 130.81 -l 171.428 -n -f 587.33 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 587.33 -l 171.428 -n -f 261.63 -l 171.428 -n -f 196.0 -l 171.428 -n -f 587.33 -l 171.428 -n -f 130.81 -l 171.428 -n -f 587.33 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 130.81 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 196.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 130.81 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 130.81 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 196.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 130.81 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.428 -n -f 130.81 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 196.0 -l 171.428 -n -f 493.88 -l 171.428 -n -f 130.81 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 493.88 -l 171.428
    just put denied beep -f 450 -l 200 -n -f 90
    just put tick beep -f 20000 -l 1
    just put tock beep -f 100 -l 10

# create ogg opus and mp3 files
convert:
    # ogg
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -q:a 4 "out/ogg/$(basename "$f" .wav).ogg" -y; done
    # opus
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -c:a libopus -b:a 64k "out/opus/$(basename "$f" .wav).opus" -y; done
    # mp3
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -c:a libmp3lame -q:a 2 "out/mp3/$(basename "$f" .wav).mp3" -y; done


