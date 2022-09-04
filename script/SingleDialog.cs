/*
 这是一个单人对话框的模板，主要用户新手指引
 */

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SingleDialog : MonoBehaviour
{
    public Text DialogText;
    public List<string> textList = new List<string>();//存储每行文案的字符串列表
    [SerializeField]
    int currentRow = 0;//当前在第几句
    bool isTyping = false;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.A))
            Respond();
    }

    private void init(TextAsset txt)
    {
        //传入策划写好的txt文档，并拆解其中的内容
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

    //携程 逐字显示
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

    //渐变效果

}
