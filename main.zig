const std = @import("std");
const lm = @cImport({
    @cInclude("libmem/libmem.h");
});

pub fn main() void {
    var proc = std.mem.zeroInit(lm.lm_process_t, .{});
    _ = lm.LM_FindProcess("firefox", &proc);
    std.debug.print("Process: {} - {s}\n", .{ proc.pid, @as([*:0]u8, @ptrCast(&proc.path)) });
}
