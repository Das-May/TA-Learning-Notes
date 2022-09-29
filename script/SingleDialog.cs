/*
 ??????????????????»…?????????????
 */

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SingleDialog : MonoBehaviour
{
    public Text DialogText;
    public List<string> textList = new List<string>();//?õ•??????????????ß“?
    [SerializeField]
    int currentRow = 0;//?????????
    bool isTyping = false;

    private void Update()
    {
        /*
        if (Input.GetKeyDown(KeyCode.A))
            Respond();
            */
    }

    private void init(TextAsset txt)
    {
        //??????ß’???txt?????????????ß÷?????
    }

    /*
    private void StartTalk(bool isContinue = true)
    {
        this.gameObject.SetActive(true);
        if (isContinue == false)             
            currentRow = 0;
        DialogText.text = textList[currentRow++];
    }*/

    public void EndTalk()
    {
        this.gameObject.SetActive(false);
        currentRow = 0;
    }

    public void Respond(float intervalTime = 0.1f, bool isContinue = true)
    {
        if(isTyping)
            isTyping = false;
        else if (currentRow < textList.Count)
        {
            isTyping = true;
            StartCoroutine(StartTalk_OneByOne(intervalTime, isContinue));
        }
        else
            EndTalk();

    }

    //ß¡?? ???????
    IEnumerator StartTalk_OneByOne(float intervalTime = 0.1f, bool isContinue = true)
    {
        this.gameObject.SetActive(true);
        if (isContinue == false)
            currentRow = 0;

        int currentLetter = 0;
        DialogText.text = "";
        while (isTyping && currentLetter < textList[currentRow].Length - 1)
        {
            DialogText.text += "<color=#00000044>" + textList[currentRow][currentLetter] + "</color>";
            yield return new WaitForSeconds(intervalTime / 3);

            DialogText.text.Replace("<color=#00000044>", "<color=#00000099>");
            yield return new WaitForSeconds(intervalTime / 3);

            DialogText.text.Replace("<color=#00000099>", "<color=#000000ff>");
            yield return new WaitForSeconds(intervalTime / 3);

            currentLetter++;
            
        }
        isTyping = false;
        currentRow++;
    }

    //????ßπ??

}
