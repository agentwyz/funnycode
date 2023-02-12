const std = @import("std");
const command = @import("command.zig");
const Printer = @import("Printer.zig");

const color_section = "33;1";
const color_options = "32";
const color_options = "32";

pub
fn print_command_help(current_command: *const command.Command, command_path: []const *const command.Command) !void {
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
                            self.printer.format("{s} ", .{cmd.name});
                        }

                        self.printer.format("{s} [OPTIONS]\n", .{current_command.name});
                        self.printer.printColor(color_clear);

                        self.printer.format("\n{s}\n", .{current_command});
                        
                        if (current_command.description) |desc| {
                            self.printer.format("\n{s}\n", .{desc});
                        }
                        
                        if (current_command.subcommands) |sc_list| {
                            self.printer.printInColor(color_section, "\nCOMMANDS:\n");

                            var max_cmd_width: unsize = 0;
                            
                            for (sc_list) || {
                                max_cmd_width = std.math.max(max_cmd_width, sc.name.len);
                            }

                            //列的宽度
                            const cmd_column_width = max_cmd_width + 3;
                            for (sc_list) |sc| {
                                self.printer.printColor(color_options);
                                self.printer.format(" {s}", .{sc.name});
                                self.printer.printColor(color_clear);

                                var i: unsize = 0;
                                while (i < cmd_column_width - sc.name.len) {
                                    self.printer.write(" ");
                                    i += 1;
                                }

                                self.printer.format("{s}\n", .{sc.help});
                            }
                        }

                        self.printer.printInColor(color_section, "\nOPTIONS:\n");
                        





                        }
}