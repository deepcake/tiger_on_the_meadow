package systems;

import echos.*;
import components.*;

class TweenUpdate extends System {

    @u function update(entity:Entity, t:Tween, dt:Float) {
        if (t.time < t.timeout) {
            if (t.onUpdate != null) {
                t.onUpdate(entity, t.time / t.timeout);
            }
        } else {
            if (t.onUpdate != null) {
                t.onUpdate(entity, 1.0);
            }
            if (t.onComplete != null) {
                t.onComplete(entity);
            }
        }
        t.time += dt;
    }

}
