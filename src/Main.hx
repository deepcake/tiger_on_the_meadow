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


    static var SIZE:Int;


    static function main() {
        var canvas = Browser.document.createDivElement();
        canvas.classList.add('meatdow');

        var info = Browser.document.createPreElement();
        info.classList.add('info');

        Browser.document.body.appendChild(canvas);
        Browser.document.body.appendChild(info);

        // make it mobile friendly (i guess)
        SIZE = Std.parseInt(Browser.window.getComputedStyle(canvas).fontSize);

        var w = Math.floor(Browser.window.innerWidth / SIZE);
        var h = Math.floor(Browser.window.innerHeight / SIZE);

        var population = Std.int(Math.max(w * h / 50, 10));

        Workflow.addSystem(new Interaction());
        Workflow.addSystem(new Movement(w, h));
        Workflow.addSystem(new Render(w, h, SIZE, canvas));
        Workflow.addSystem(new TweenUpdate());

        // fill world by plants
        for (y in 0...h) {
            for (x in 0...w) {
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
            rabbit(Std.random(w), Std.random(h));
        }

        // tiger!
        tiger(Std.random(w), Std.random(h));

        var fps = 60;
        Browser.window.setInterval(function() Workflow.update(fps / 1000), fps);
    }

}
