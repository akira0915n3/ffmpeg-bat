@echo off
rem -----------------------
rem FFMpeg D&D Tools
rem -----------------------

rem �ϐ���`
set pas=ffmpeg.exe 


rem �f���g���b�N�̒�`
set mvmap=0:0

rem �����g���b�N�̐ݒ�(��i�ɂ���ĈقȂ邽�߁A���[�U�[����I��)
:mumap_settings
echo �f���g���b�N�̐ݒ�����Ă��������B��: 0:1
set /p mumap="INPUT:"

:encoded_settings
echo �G���R�[�h�̐ݒ��I�����Ă��������B
echo 1:�f���E�������̂܂܂�mov�ɕϊ�
echo 2:MP4�ɕϊ�(�������򉻂��܂��B)
echo 3:H.265 NVENC (NVIDIA GPU���K�v�ł��B)
echo 4:H.264 NVENC (NVIDIA GPU���K�v�ł��B)

echo 1~4�̂ǂꂩ��I�����Ă��������B
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
    echo �G���[�ł��B1~4�̂ǂꂩ����͂��Ă��������B
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
