package andreware.utils;

import cpp.Random;

class RandomHelper
{
	/** Return a random boolean value (true or false) */
	public static inline function randomBool():Bool
	{
		return Math.random() < 0.5;
	}

	/** Return a random integer between 'from' and 'to', inclusive. */
	public static inline function randomInt(from:Int, to:Int):Int
	{
		return from + Math.floor(((to - from + 1) * Math.random()));
	}

	/** Return a random float between 'from' and 'to', inclusive. */
	public static inline function randomFloat(from:Float, to:Float):Float
	{
		return from + ((to - from) * Math.random());
	}

	/** Return a random string of a certain length.  You can optionally specify
	    which characters to use, otherwise the default is (a-zA-Z0-9) */
	public static function randomString(length:Int, ?charactersToUse = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"):String
	{
		var str = "";
		for (i in 0...length)
		{
			str += charactersToUse.charAt(new Random().int(charactersToUse.length - 1));
		}
		return str;
	}

	/** Return a random date & time from within a range.  The behaviour is unspecified if either `earliest` or `latest` is null.  Earliest and Latest are inclusive */
	public static inline function randomDate(earliest:Date, latest:Date):Date
	{
		return Date.fromTime( randomFloat(earliest.getTime(), latest.getTime()) );
	}

	/** Return a random item from an array.  Will return null if the array is null or empty. */
	public static inline function randomItem<T>(arr:Array<T>):Null<T>
	{
		return (arr != null && arr.length > 0) ? arr[randomInt(0, arr.length - 1)] : null;
	}

	/** Shuffle an Array.  This operation affects the array in place, and returns that array.
		The shuffle algorithm used is a variation of the [Fisher Yates Shuffle](http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle) */
	public static function shuffle<T>(arr:Array<T>):Array<T>
	{
		if (arr!=null) {
			for (i in 0...arr.length) {
				var j = randomInt(0, arr.length - 1);
				var a = arr[i];
				var b = arr[j];
				arr[i] = b;
				arr[j] = a;
			}
		}
		return arr;
	}

	/** Return a random item from an iterable.  Will return null if the iterable is null or empty. */
	public static inline function randomIterable<T>(it:Iterable<T>):Null<T>
	{
		return (it != null) ? randomItem(Lambda.array(it)) : null;
	}

	/** Return a random constructor from an Enum.  Will return null if the enum has no constructors. Only works with enum constructors that take no parameters. */
	public static inline function randomEnum<T>(e:Enum<T>):Null<T>
	{
		return (e!=null) ? randomItem(Type.allEnums(e)) : null;
	}
}
