using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Random = UnityEngine.Random;

public class buttonShake : MonoBehaviour
{
    private float InitialFade = 1f;
    private float InitialMove = 0.5f;
    
    // Start is called before the first frame update
    void Start()
    {
        transform.LeanMoveLocalX(Random.Range(-300.0f, 300.0f), InitialMove).setEaseInOutQuad();
        StartCoroutine(startFloating());
        StartCoroutine(fadeButtons());
    }

    IEnumerator fadeButtons()
    {
        yield return new WaitForSeconds(InitialMove);
        CanvasGroup canvasgroup = GetComponent<CanvasGroup>();
        canvasgroup.alpha = 0;
        LeanTween.value(gameObject, 0, 1, 1).setOnUpdate((float val) =>
        {
            canvasgroup.alpha = val;
        });
    }

    IEnumerator startFloating()
    {
        yield return new WaitForSeconds(InitialMove);
        float tempTransform = transform.position.x;
        transform.LeanMoveX(Random.Range(tempTransform-20.0f, tempTransform+20.0f), Random.Range(5, 15)).setEaseInOutQuad()
            .setLoopPingPong();
    }
}
