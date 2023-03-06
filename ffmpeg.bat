@echo off
rem -----------------------
rem FFMpeg D&D Tools
rem -----------------------

rem 変数定義
set pas=ffmpeg.exe 


rem 映像トラックの定義
set mvmap=0:0

rem 音声トラックの設定(作品によって異なるため、ユーザーから選択)
:mumap_settings
echo 映像トラックの設定をしてください。例: 0:1
set /p mumap="INPUT:"

:encoded_settings
echo エンコードの設定を選択してください。
echo 1:映像・音声そのままでmovに変換
echo 2:MP4に変換(音声が劣化します。)
echo 3:H.265 NVENC (NVIDIA GPUが必要です。)
echo 4:H.264 NVENC (NVIDIA GPUが必要です。)

echo 1~4のどれかを選択してください。
set /p encoded_settings="Number:"
if "%encoded_settings%" == "1"(
    goto :encoded_to_mov
)else if "%encoded_settings%" == "2"(
    goto :encoded_to_mp4
)else if "%encoded_settings%" == "3"(
    goto :encoded_to_hevc
)else if "%encoded_settings%" == "4"(
    goto :encoded_to_h264
)else(
    echo エラーです。1~4のどれかを入力してください。
    goto :encoded_settings
)

:encoded_to_mov
mkdir %~dp0\ffmpeg
%pas% -i %1 -codec:v copy -codec:a copy -map %mvmap% -map %mumap%  "%~dp0\ffmpeg\%~n1.mov"

:encoded_to_mp4
mkdir %~dp0\ffmpeg
%pas% -i %1 -codec:v copy -map %mvmap% -map %mumap% "%~dp0\ffmpeg\%~n1.mp4"

:encoded_3

:encoded_4


echo %mvmap%
