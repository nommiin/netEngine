///netPacketServer(buffer,id)
var netBuf = argument[0], netSocket = argument[1];
buffer_seek(netBuf,buffer_seek_start,0)
// -- Read the first u8 value in our buffer we recieved from the packet, then switch through to see if it is equal to any
// -- of the packet headers we have, if not just log that it is an unknown header.
switch buffer_read(netBuf,buffer_u8) {
    case msgPing: {
        // -- Since the client wants to calculate their ping, we'll simply just send that time we
        // -- recieved from them back to them so they can calculate their ping with the old time.
        netPacketSend(netSocket,msgPing,buffer_u32,buffer_read(netBuf,buffer_u32))
    break}
    
    default: {
        // -- We recieved an unknown packet header, we'll just log and say that it was unknown.
        show_debug_message("Unknown Packet Header! Ignoring!")
    }
}
