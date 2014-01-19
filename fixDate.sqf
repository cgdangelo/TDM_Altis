if !(isServer) exitWith {};

_startTime = Date;

while{true} do
{
    sleep 60;
    setDate _startTime;
}