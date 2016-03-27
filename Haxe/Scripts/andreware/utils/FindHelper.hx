package andreware.utils;

import unreal.*;

class FindHelper
{
    // public static function FindObject<T:UObject>(path:String):T
    // {
    //     var findObject:FObjectFinder<T> = FObjectFinder.Find(path);
    //
    //     if(findObject.Succeeded())
    //     {
    //         return findObject.Object;
    //     }
    //
    //     return null;
    // }

    public static function FindClass(path:String):TSubclassOf<Dynamic>
    {
        var findClass:FClassFinder<UObject> = FClassFinder.Find(path);

        if(findClass.Succeeded())
        {
            return findClass.Class;
        }

        return null;
    }
}
