using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using DG.Tweening;

public class SimpleButtonAnimation : MonoBehaviour
{
    private RectTransform _rectTransform;
    private Tween tweenScale;
    private Tween tweenShake;

    [SerializeField] private float _duration = 0.15f;
    [SerializeField] private float _scale = 1.1f;

    private void Awake()
    {
        _rectTransform = GetComponent<RectTransform>();

        tweenScale = _rectTransform.DOScale(_scale, _duration).SetEase(Ease.InOutSine).Pause().SetAutoKill(false);
        tweenShake = _rectTransform.DOPunchScale(-0.05f * Vector3.one, _duration).SetEase(Ease.InOutSine).Pause().SetAutoKill(false);
    }

    public void OnPointerEnter()
    {
        tweenScale.PlayForward();
    }

    public void OnPointerExit()
    {
        tweenScale.PlayBackwards();
    }

    public void OnPointerClick()
    {
        tweenShake.Restart();
    }
}
