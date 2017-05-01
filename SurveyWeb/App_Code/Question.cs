using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Question 的摘要说明
/// </summary>
public class Question
{
    public int id;

    public int survey_id;

    public string title;

    public int type;

    public int num;

    public List<Option> options;

    public int click_count;

	public Question()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
}