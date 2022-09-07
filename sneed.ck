fun void sneed( SndBuf buf, int reverse )
{
    "sneed.wav" => buf.read;
    if( reverse == 0 )
    {
        buf.samples() => buf.pos;
        buf.rate(-1);
    }
    buf.length() => now;
}

SndBuf buf => dac;
-1 => int help;
-1 => int loop;
-1 => int reverse;

for( int i; i < me.args(); i++ ) 
{
    me.arg(i) => string arg;
    if( arg.find("help") != -1 ) 
        0 => help;
    if( arg.find("loop") != -1 ) 
        0 => loop;
    if( arg.find("reverse") != -1 )
        0 => reverse;
}

if( help == 0 )
{
    <<< "Sneed-ChucK Help\nloop\tEnables looping\nreverse\tReverses the audio\nhelp\tShows this menu" >>>;
    me.exit();
}

if( reverse == 0 )
    <<< "Playing in reverse" >>>;

if( loop == 0 )
{
    <<< "Looping enabled" >>>;
    while( true )
        sneed( buf, reverse );
}

sneed( buf, reverse );