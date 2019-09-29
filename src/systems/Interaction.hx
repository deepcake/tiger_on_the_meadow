package systems;

import echos.*;
import components.*;
import Builder.*;

class Interaction extends System {


    var animals:View<Animal, Position>;


    @u inline function interaction(dt:Float) {
        // micro optimizaion to not test each entity twice
        var h1 = animals.entities.head;
        while (h1 != null) {

            var entity1 = h1.value;
            var a1 = entity1.get(Animal);
            var pos1 = entity1.get(Position);

            var h2 = h1.next;
            while (h2 != null) {

                var entity2 = h2.value;
                var a2 = entity2.get(Animal);
                var pos2 = entity2.get(Position);

                if (test(pos1, pos2, 1.0)) {

                    switch (a1) {
                        case Tiger: {
                            switch (a2) {
                                case Tiger: {

                                }
                                case Rabbit: {
                                    tigerEatsRabbit(entity1, entity2);
                                }
                            }
                        }
                        case Rabbit: {
                            switch (a2) {
                                case Tiger: {
                                    tigerEatsRabbit(entity2, entity1);
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

    function tigerEatsRabbit(tiger:Entity, rabbit:Entity) {
        trace('#$tiger eats #$rabbit');
        newRabbitDeath(rabbit.get(Position).x, rabbit.get(Position).y);
        rabbit.destroy();
    }

    function test(pos1:Position, pos2:Position, radius:Float) {
        var dx = pos2.x - pos1.x;
        var dy = pos2.y - pos1.y;
        return dx * dx + dy * dy < radius * radius;
    }


}
