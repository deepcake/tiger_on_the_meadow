package components;

import echos.Entity;

class Tween {

    public var time:Float;
    public var timeout:Float;
    public var onUpdate:Entity->Float->Void;
    public var onComplete:Entity->Void;

    public function new(timeout:Float, ?onUpdate:Entity->Float->Void, ?onComplete:Entity->Void) {
        this.time = .0;
        this.timeout = timeout;
        this.onUpdate = onUpdate;
        this.onComplete = onComplete;
    }

}
