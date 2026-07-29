# https://just.systems

CUBIC_BETA := "0.3"

ffmpeg_params := "-hide_banner -loglevel warning -ch_layout mono"

ref := env_var_or_default('GITHUB_REF_NAME', env_var_or_default('GITHUB_SHA', 'local'))
build_date := `date +%d-%m-%Y`

preamble := f'''
piezo sounds pack

version: {{ref}} at {{build_date}}

---

'''

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

# play all tones
play:
    @for tone in tones/*; do \
        printf '→ %s\n' "$(basename "$tone")"; \
        ./beep2wav/beep2wav --cubic-beta {{CUBIC_BETA}} -- "$tone" >/dev/null 2>&1; \
        sleep 0.1; \
    done
    @printf 'done.\n'

# build everything properly
[working-directory: 'out']
build: precheck prepare generate convert
    printf '{{preamble}}\n' > readme.txt
    cat ../UNLICENSE >> readme.txt
    cp -rT ../tones ./beep
    zip -r ../piezo_sounds.zip .

# remove build artifacts
clean:
    git clean -fdX
    git submodule foreach git clean -fdX

# fetch submodule and build tool
prepare:
    git submodule update --init
    @just --justfile beep2wav/justfile build
    mkdir -p out/wav
    mkdir -p out/ogg
    mkdir -p out/opus
    mkdir -p out/mp3

# generate wavs from tones/
generate: prepare
    @for tone in tones/*; do \
        ./beep2wav/beep2wav -o "./out/wav/$(basename "$tone").wav" --cubic-beta {{CUBIC_BETA}} -- "$tone"; \
    done

# create ogg opus and mp3 files
convert:
    # ogg
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -q:a 4 "out/ogg/$(basename "$f" .wav).ogg" -y; done
    # opus
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -c:a libopus -b:a 64k "out/opus/$(basename "$f" .wav).opus" -y; done
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -c:a libopus -b:a 64k "assets/$(basename "$f" .wav).opus" -y; done
    # mp3
    for f in out/wav/*.wav; do ffmpeg {{ffmpeg_params}} -i "$f" -c:a libmp3lame -q:a 2 "out/mp3/$(basename "$f" .wav).mp3" -y; done

# build html table
table branch=`git branch --show-current`:
    @printf '<table>\n'
    @printf '<tbody>\n'
    @for f in assets/*.opus; do \
        name="$(basename "$f" .opus)"; \
        url="https://raw.githubusercontent.com/izzqz/piezo-sounds/refs/heads/{{branch}}/assets/$name.opus"; \
        printf '  <tr><td>%s</td><td><audio controls src="%s"></audio></td></tr>\n' "$name" "$url"; \
    done
    @printf '</tbody>\n'
    @printf '</table>\n'

new name:
    printf '#!/bin/sh\nexec beep\n' > "tones/{{name}}"
    chmod +x "tones/{{name}}"
    $EDITOR tones/{{name}}
