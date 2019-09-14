package;

import echos.Entity;
import components.*;
import components.Animal;

class Builder {


    static var GRASS = [ '🌾', '🌿' ];
    static var TREE = [ '🌲', '🌳' ];
    static var FLOWER = [ '🌻', '🥀', '🌹', '🌷' ];
    static var MEAT = [ '🥩', '🍗', '🍖' ];

    static var RABBIT = '🐇';
    static var TIGER = '🐅';


    public static function grass(x:Float, y:Float) {
        new Entity().add(
            new Position(x, y),
            new Sprite(getRandomEmoji(GRASS), 1.0 + Math.random() * 0.25)
        );
    }

    public static function tree(x:Float, y:Float) {
        new Entity().add(
            new Position(x, y), 
            new Sprite(getRandomEmoji(TREE), 1.75 + Math.random() * 0.25)
        );
    }

    public static function flower(x:Float, y:Float) {
        new Entity().add(
            new Position(x, y),
            new Sprite(getRandomEmoji(FLOWER), 0.75 + Math.random() * 0.25)
        );
    }

    public static function rabbit(x:Float, y:Float):Entity {
        var pos = new Position(x, y);
        var vel = getRandomVelocity(1);
        var spr = new Sprite(RABBIT, 1.0);
        return new Entity().add(pos, vel, spr, Rabbit);
    }

    public static function tiger(x:Float, y:Float):Entity {
        var pos = new Position(x, y);
        var vel = getRandomVelocity(10);
        var spr = new Sprite(TIGER, 1.5);
        return new Entity().add(pos, vel, spr, Tiger);
    }


    static function getRandomEmoji(codes:Array<String>) {
        return codes[Std.random(codes.length)];
    }

    static function getRandomVelocity(speed:Float) {
        var d = Math.random() * Math.PI * 2;
        return new Velocity(Math.cos(d) * speed, Math.sin(d) * speed);
    }

    static function getOpacityTween(from:Float, delta:Float) {
        return (e:Entity, t:Float) -> e.get(Sprite).setOpacity(from + t * delta);
    }

    static function getSizeTween(from:Float, delta:Float) {
        return (e:Entity, t:Float) -> e.get(Sprite).setSize(from + t * delta);
    }

    static function getSizeAndOpacityTween(fromSize:Float, deltaSize:Float, fromOpacity:Float, deltaOpacity:Float) {
        var t1 = getSizeTween(fromSize, deltaSize);
        var t2 = getOpacityTween(fromOpacity, deltaOpacity);
        return (e:Entity, t:Float) -> {
            t1(e, t);
            t2(e, t);
        }
    }

    static function getFlickerTween() {
        return (e:Entity, t:Float) -> e.get(Sprite).setOpacity(Std.int(t * 50) % 4 == 0 ? 0.0 : 1.0);
    }

}
