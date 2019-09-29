package;

import echos.Workflow;
import components.*;
import systems.*;
import Builder.*;
import js.Browser;
import js.html.Element;

/**
 * ...
 * @author https://github.com/deepcake
 */
class Main {


    public static var WIDTH:Int;
    public static var HEIGHT:Int;
    public static var SIZE:Int;


    static function main() {
        var canvas = Browser.document.createDivElement();
        canvas.classList.add('meatdow');

        var info = Browser.document.createPreElement();
        info.classList.add('info');

        Browser.document.body.appendChild(canvas);
        Browser.document.body.appendChild(info);

        // make it mobile friendly (i guess)
        SIZE = Std.parseInt(Browser.window.getComputedStyle(canvas).fontSize);

        WIDTH = Math.floor(Browser.window.innerWidth / SIZE);
        HEIGHT = Math.floor(Browser.window.innerHeight / SIZE);

        var population = Std.int(Math.max(WIDTH * HEIGHT * 0.02, 10));

        trace(WIDTH, HEIGHT, population);

        Workflow.addSystem(new Interaction());
        Workflow.addSystem(new Movement(WIDTH, HEIGHT));
        Workflow.addSystem(new Render(WIDTH, HEIGHT, SIZE, canvas));
        Workflow.addSystem(new TweenUpdate());

        // fill world by plants
        for (y in 0...HEIGHT) {
            for (x in 0...WIDTH) {
                if (Math.random() < .75) {
                    grass(x, y); 
                } else {
                    if (Math.random() < .25) {
                        tree(x, y); 
                    } else {
                        flower(x, y);
                    }
                }
            }
        }

        // some rabbits
        for (i in 0...population) {
            rabbit(Std.random(WIDTH), Std.random(HEIGHT));
        }

        // tiger!
        tiger(Std.random(WIDTH), Std.random(HEIGHT));

        Browser.window.setInterval(function() Workflow.update(60 / 1000), 60);
    }

}
