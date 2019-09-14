package systems;

import echos.*;
import components.*;

class Interaction extends System {

    var animals:View<Animal->Position>;

    @u inline function interaction(dt:Float) {
        var h1 = animals.entities.head;
        while (h1 != null) {

            var h2 = h1.next;
            while (h2 != null) {

                var entity1 = h1.value;
                var a1 = entity1.get(Animal);
                var pos1 = entity1.get(Position);

                var entity2 = h2.value;
                var a2 = entity2.get(Animal);
                var pos2 = entity2.get(Position);

                if (test(pos1, pos2, 15)) {

                    switch (a1) {
                        case Tiger: {
                            switch (a2) {
                                case Rabbit: {
                                    eats(entity1, entity2);
                                }
                                default: 
                            }
                        }
                        case Rabbit: {
                            switch (a2) {
                                case Tiger: {
                                    eats(entity2, entity1);
                                }
                                case Rabbit: {

                                }
                            }
                        }
                    }

                }

                h2 = h2.next;
            }

            h1 = h1.next;
        }
    }

    function eats(tiger:Entity, rabbit:Entity) {
        trace('#$tiger eats #$rabbit');
        rabbit.destroy();
    }

    function test(pos1:Position, pos2:Position, radius:Float) {
        var dx = pos2.x - pos1.x;
        var dy = pos2.y - pos1.y;
        return dx * dx + dy * dy < radius * radius;
    }

}
