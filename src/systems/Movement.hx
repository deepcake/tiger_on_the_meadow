package systems;

import echos.*;
import components.*;

class Movement extends System {

    var w:Float;
    var h:Float;

    public function new(w:Float, h:Float) {
        this.w = w;
        this.h = h;
    }

    @u inline function move(dt:Float, pos:Position, vel:Velocity) {
        var dx = vel.x * dt;
        var dy = vel.y * dt;

        if (pos.x + dx >= w || pos.x + dx <= 0) {
            vel.x *= -1;
        }

        if (pos.y + dy >= h || pos.y + dy <= 0) {
            vel.y *= -1;
        }

        pos.x += dx;
        pos.y += dy;
    }

}
