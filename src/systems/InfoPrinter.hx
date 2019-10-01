package systems;

import echoes.View;
import components.Animal;
import js.html.Element;
using Lambda;

class InfoPrinter extends echoes.System {


    final animals:View<Animal>;


    var element:Element;


    public function new(element:Element) {
        this.element = element;
    }

    @u function print() {
        element.innerHTML = '${ echoes.Workflow.info() }';
        element.innerHTML += '\n\nRABBITS: ' + animals.entities.count(e -> e.get(Animal) == Animal.Rabbit);
        element.innerHTML += '\n\nTIGERS: ' + animals.entities.count(e -> e.get(Animal) == Animal.Tiger);
    }


}
