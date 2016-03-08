///netPacketClient(buffer)
var netBuf = argument[0];
buffer_seek(netBuf,buffer_seek_start,0)
switch buffer_read(netBuf,buffer_u8) {
    case msgPing: {
        netPing = floor((current_time-buffer_read(netBuf,buffer_u32))-(8*(room_width/1000)))
    break}
}
