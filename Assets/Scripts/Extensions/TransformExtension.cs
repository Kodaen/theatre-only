using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class TransformExtension
{
    public static void ChangePositionWith(this Transform transform, float? x = null, float? y = null, float? z = null)
    {
        transform.position = transform.position.With(x, y, z);
    }

    public static void ChangeScaleWith(this Transform transform, float? x = null, float? y = null, float? z = null)
    {
        transform.localScale = transform.localScale.With(x, y, z);
    }

    public static void InverseScaleX(this Transform transform)
    {
        transform.localScale = transform.localScale.With(x: -transform.localScale.x);
    }

    public static void InverseScaleY(this Transform transform)
    {
        transform.localScale = transform.localScale.With(y: -transform.localScale.y);
    }
}
