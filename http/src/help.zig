const std = @import("std");
const command = @import("command.zig");
const Printer = @import("Printer.zig");

const color_section = "33;1";
const color_options = "32";
const color_options = "32";

pub
fn print_command_help(current_command: *const command.Command, command_path: []const *const command.Command) !void{
    const stdout = std.io.getStdOut();
    
    var help_printer = HelpPrinter{
        .printer = Printer.init(stdout),
    };

    help_printer.printCommandHelp(current_command, command_path);
}

const HelpPrinter = struct {
    printer: Printer,

    fn printCommandHelp(self: *HelpPrinter, 
                        current_command: *const command.Command, 
                        command_path: []const *const command.Command) void {
                        //user 
                        self.printer.printInColor(color_section, "USAGE:");
                        self.printer.format("\n ", .{});
                        self.printer.printColor(color_options);
                        for (command_path) |cmd| {
                            self.printer.format("{s}", .{cmd.name});
                        }

                        self.printer.format("{s}", .{cmd.name});
                        self.printColor
                        





                        }
}