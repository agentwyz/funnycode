const std = @import("std");

pub const OptionType = enum {
    long,
    short,
};

pub const OptionInterpretation = struct {
    option_type: OptionType,
    name: []const u8,
    value: ?[]const u8 = null,
};

pub const ArgumentInterpretation = union(enum) {
    option: OptionInterpretation,
    double_dash: void,
    other: []const u8,
};

pub fn interpret(arg: []const u8) !ArgumentInterpretation {
    if (arg.len == 0) return ArgumentInterpretation{ .other = arg };

    if (arg[0] == '-') {
        if (arg.len == 1) return ArgumentInterpretation{ .other = arg };

        var name = arg[1..];
        var option_type = OptionType.short;

        if (arg[1] == '-') {
            if (arg.len == 2) return ArgumentInterpretation.double_dash;
            name = arg[2..];
            option_type = .long;
        }

        if (std.mem.indexOfScalar(u8, name, '=')) |ix| {
            if (name.len < ix + 2) return error.MissingOptionArgument;
            return ArgumentInterpretation{ .option = OptionInterpretation{
                .option_type = option_type,
                .name = name[0..ix],
                .value = name[ix + 1 ..],
            } };
        } else {
            return ArgumentInterpretation{ .option = OptionInterpretation{
                .option_type = option_type,
                .name = name,
            } };
        }
    } else {
        return ArgumentInterpretation{ .other = arg };
    }
}

const expect = std.testing.expect;

test "long without value" {
    const out = try interpret("--abc");
    try expect(out.option.option_type == .long);
    try expect(std.mem.eql(u8, out.option.name, "abc"));
    try expect(out.option.value == null);
}
