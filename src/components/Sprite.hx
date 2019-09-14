package components;

import js.html.Element;
import js.Browser;

@:forward(remove, style)
abstract Sprite(Element) from Element to Element {

    public inline function new(value:String, size:Float = 1.0) {
        this = Browser.document.createSpanElement();
        this.style.position = 'absolute';
        this.style.right = '0px';
        this.style.bottom = '0px';
        this.innerHTML = value;
        setSize(size);
    }

    public inline function setOpacity(value:Float) {
        this.style.opacity = '${ value }';
    }

    public inline function setSize(value:Float) {
        this.style.fontSize = '${ Std.int(value * 100) }%';
    }

}
