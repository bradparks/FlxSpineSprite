package spinehx.platform.nme;
import openfl.Assets;
import spinehx.atlas.Texture;
import flash.display.BitmapData;
class BitmapDataTexture implements Texture {
    public var bd:BitmapData;
    public function new(textureFile:String) {
        this.bd =  Assets.getBitmapData(textureFile);
    }
    public function getWidth():Int {
        return bd.width;
    }
    public function getHeight():Int {
        return bd.height;
    }
    public function dispose():Void { bd.dispose(); }
    public function setWrap(uWrap, vWrap):Void {  }
    public function setFilter(minFilter, magFilter):Void {  }
}
