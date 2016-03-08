///netPacketClient(buffer)
var netBuf = argument[0];
buffer_seek(netBuf,buffer_seek_start,0)
// -- Read the first u8 value in our buffer we recieved from the packet, then switch through to see if it is equal to any
// -- of the packet headers we have, if not just log that it is an unknown header.
switch buffer_read(netBuf,buffer_u8) {
    case msgPing: {
        // -- Use the reply we got back from the server to calculate our ping.
        // -- We sent the server our current time and so some time had to have passed so let's just get our current current time
        // -- and subtract that from the time we sent to the server which was sent pack.
        // -- As well as making sure the packet delay in milliseconds is properly deducted from the ping.
        netPing = floor((current_time-buffer_read(netBuf,buffer_u32))-(8*(room_width/1000)))
    break}
    
    default: {
        // -- We recieved an unknown packet header, we'll just log and say that it was unknown.
        show_debug_message("Unknown Packet Header! Ignoring!")
    }
}
