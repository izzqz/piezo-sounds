# https://just.systems

default: generate

generate *qubic="0.2":
    ./beep2wav -o ./bank/lookup.wav --cubic-beta {{ qubic }} -- beep -f 1093 -l 50 -n -f 865 -l 50 -n -f 1093 -l 50 -n -f 1637 -l 100
    ./beep2wav -o ./bank/done.wav   --cubic-beta {{ qubic }} -- beep -f 2077 -l 80 -n -f 3077 -l 80
    ./beep2wav -o ./bank/awake.wav  --cubic-beta {{ qubic }} -- beep -f 1000 -l 300 -n -f 1500 -r 4 -l 10 -n -f 2000 -l 80;
    ./beep2wav -o ./bank/ringing_high.wav  --cubic-beta {{ qubic }} -- beep -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 400 \
                                  -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70 -D 0 -n -f 1000 -l 70 -D 0 -n -f 2050 -l 70
    ./beep2wav -o ./bank/ringing_mid.wav --cubic-beta {{ qubic }} -- beep -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 25 \
                                    -n -f 1000 -l 80 -D 25 -n -f 2050 -l 80 -D 1200
    ./beep2wav -o ./bank/ping.wav   --cubic-beta {{ qubic }} -- beep -f 2200 -l 70 -D 90 -n -f 2800 -l 55
    # ./beep2wav -o ./bank/discord_call.wav --cubic-beta {{ qubic }} -- beep -n -f 130.81 -l 171.428 -n -f 587.33 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 587.33 -l 171.428 -n -f 261.63 -l 171.428 -n -f 196.0 -l 171.428 -n -f 587.33 -l 171.428 -n -f 130.81 -l 171.428 -n -f 587.33 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 130.81 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 196.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 130.81 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 493.88 -l 171.429 -n -f 130.81 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 196.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 130.81 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.429 -n -f 261.63 -l 171.429 -n -f 392.0 -l 171.429 -n -f 587.33 -l 171.428 -n -f 130.81 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 196.0 -l 171.428 -n -f 493.88 -l 171.428 -n -f 130.81 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 493.88 -l 171.428 -n -f 261.63 -l 171.428 -n -f 392.0 -l 171.428 -n -f 493.88 -l 171.428
    ./beep2wav -o ./bank/denied.wav --cubic-beta {{ qubic }} -- beep -f 450 -l 200 -n -f 90
    ./beep2wav -o ./bank/tick.wav --cubic-beta {{ qubic }} -- beep -f 20000 -l 1
    ./beep2wav -o ./bank/tock.wav --cubic-beta {{ qubic }} -- beep -f 100 -l 10

