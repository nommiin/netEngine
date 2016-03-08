///netPacketServer(buffer,id)
var netBuf = argument[0], netSocket = argument[1];
buffer_seek(netBuf,buffer_seek_start,0)
switch buffer_read(netBuf,buffer_u8) {
    case msgPing: {
        netPacketSend(netSocket,msgPing,buffer_u32,buffer_read(netBuf,buffer_u32))
    break}
}
