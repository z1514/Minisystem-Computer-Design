// for legacy browsers
const AudioContext = window.AudioContext || window.webkitAudioContext;

const audioContext = new AudioContext();

// get the audio element
const audioElement = document.querySelectorAll('audio');

var audio_count=5;
var is_playing=false;

function init_audio()
{
    var track = new Array();
    for(let i=0;i<audioElement.length;i++)
    {
        // pass it into the audio context
        track[i]=audioContext.createMediaElementSource(audioElement[i]);
        track[i].connect(audioContext.destination);
        // audioElement[i].addEventListener('ended', () => {
        //     //播放结束的响应函数
        //     is_playing=false;
        // }, false);
    }
}

function play_audio()
{
    console.log(audioElement);
    let i=audio_count%(audioElement.length);
    audioElement[i].play();
    //is_playing=true;
    audio_count++;
}

var current_audio_rad_count=0;
function random_play_audio()
{
    //取0到99的随机整数
    let rad=Math.floor(Math.random()*100);
    if(rad<current_audio_rad_count){
        play_audio();
        current_audio_rad_count=0;
    }
}

