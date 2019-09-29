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

    public inline function setOpacity(value:Float):Sprite {
        this.style.opacity = '${ value }';
        return this;
    }

    public inline function setSize(value:Float):Sprite {
        this.style.fontSize = '${ Std.int(value * 100) }%';
        return this;
    }

}
