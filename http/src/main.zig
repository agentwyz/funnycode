const std = @import("std");

pub fn main() anyerror!void {
    var i: i32 = 14;
    while (i < 18) : (i += 1) {
        //14, 
        std.debug.print("{d}\n", .{i});
    }
}
