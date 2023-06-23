const std = @import("std");

const Point = struct {
  x: i32,
  y: i32,
};

const Line = struct {
  start: Point,
  end: Point,
};

pub fn distance(line: Line) u32 {
  const x_diff = std.math.pow(i32, (line.start.x - line.end.x), 2);
  const y_diff = std.math.pow(i32, (line.start.y - line.end.y), 2);

  return std.math.sqrt(@intCast(u32, x_diff) + @intCast(u32, y_diff));
}

pub fn main() !void {
  const stdout = std.io.getStdOut().writer();
  const point1 = Point{
    .x=2,
    .y=2,
  };
  const point2 = Point{
    .x=5,
    .y=10,
  };

  const line = Line{
    .start=point1,
    .end=point2
  };

  try stdout.print("{any}\n", .{distance(line)});
}