package systems;

import echoes.*;
import components.*;

class TweenUpdate extends System {

    @u function update(entity:Entity, t:Tween, dt:Float) {
        if (t.time < t.timeout) {
            if (t.onUpdate != null) {
                t.onUpdate(t.time / t.timeout);
            }
            t.time += dt;
        } else {
            if (t.onUpdate != null) {
                t.onUpdate(1.0);
            }
            if (t.onComplete != null) {
                t.onComplete();
            }
            entity.destroy();
        }
    }

}
