package;

import echos.Entity;
import components.*;
import components.Animal;

class Builder {


    static var GRASS = [ '🌾', '🌿' ];
    static var TREE = [ '🌲', '🌳' ];
    static var FLOWER = [ '🌻', '🥀', '🌹', '🌷' ];

    static var MEAT = '🍖';

    static var RABBIT = '🐇';
    static var TIGER = '🐅';
    static var GHOST = '👻';


    public static function grass(x:Float, y:Float) {
        new Entity().add(
            new Position(x, y),
            new Sprite(getRandomEmoji(GRASS), 1.0 + Math.random() * 0.25)
        );
    }

    public static function tree(x:Float, y:Float) {
        new Entity().add(
            new Position(x, y), 
            new Sprite(getRandomEmoji(TREE), 1.50 + Math.random() * 0.50)
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
        var spr = new Sprite(RABBIT, 1.00);
        return new Entity().add(pos, vel, spr, Rabbit);
    }

    public static function tiger(x:Float, y:Float):Entity {
        var pos = new Position(x, y);
        var vel = getRandomVelocity(7.5);
        var spr = new Sprite(TIGER, 1.50);
        return new Entity().add(pos, vel, spr, Tiger);
    }


    public static function newGhost(x:Float, y:Float):Entity {
        var pos = new Position(x, y);
        var vel = getRandomVelocity(2);
        var spr = new Sprite(GHOST, 1.00);
        return new Entity().add(pos, vel, spr);
    }

    public static function newMeat(x:Float, y:Float):Entity {
        var pos = new Position(x, y);
        var spr = new Sprite(MEAT, 1.00);
        return new Entity().add(pos, spr);
    }

    public static function newTween(timeout:Float, ?onUpdate:Float->Void, ?onComplete:Void->Void) {
        return new Entity().add(new Tween(timeout, onUpdate, onComplete));
    }

    public static function newRabbitDeath(x:Float, y:Float) {
        var ghost = newGhost(x, y);
        newTween(5.0, t -> ghost.get(Sprite).setOpacity(1.0 - 1.0 * t).setSize(1.0 + 1.0 * t), () -> ghost.destroy());

        var posx = Math.round(Math.random()) * (Main.WIDTH - 1);
        var posy = Math.round(Math.random()) * (Main.HEIGHT - 1);
        newTween(10.0, null, () -> rabbit(posx, posy));

        var meat = newMeat(x, y);
        newTween(5.0, t -> meat.get(Sprite).setOpacity(1.0 - 1.0 * t), () -> meat.destroy());
    }


    static function getRandomEmoji(codes:Array<String>) {
        return codes[Std.random(codes.length)];
    }

    static function getRandomVelocity(speed:Float) {
        var d = Math.random() * Math.PI * 2;
        return new Velocity(Math.cos(d) * speed, Math.sin(d) * speed);
    }

}
