package systems;

import echos.View;
import components.Animal;
import js.html.Element;
using Lambda;

class InfoPrinter extends echos.System {


    final animals:View<Animal>;


    var element:Element;


    public function new(element:Element) {
        this.element = element;
    }

    @u function print() {
        element.innerHTML = '${ echos.Workflow.info() }';
        element.innerHTML += '\n\nRABBITS: ' + animals.entities.count(e -> e.get(Animal) == Animal.Rabbit);
        element.innerHTML += '\n\nTIGERS: ' + animals.entities.count(e -> e.get(Animal) == Animal.Tiger);
    }


}
