use nightmare;

insert into essay
value(
null, 
"Windows",
"window删除多余右键菜单和开始菜单",
"	
<h1>window删除多余右键菜单和开始菜单</h1>

<div>
<span><div><span style=\"color: rgb(51, 51, 51); font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">还可以 运行regedit</span></div><div><span style=\"color: rgb(51, 51, 51); font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">进入HKEY_CLASSES_ROOT\\Directory\\Background\\shellex\\ContextMenuHandlers目录</span></div><div><span style=\"color: rgb(51, 51, 51);\"><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;;\">删除对应的选项</span></span></span></div><div><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;;\"><span style=\"color: rgb(51, 51, 51);\"><br/></span></span></span></div><div><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\">下面两项，对应intel核显的桌面右键菜单</span></span></span></span></div><div style=\"margin-left:40px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\">igfxDTCM       {9B5F5829-A529-4B12-814A-E81BCB8D93FC}</span></span></span></span></div><div style=\"margin-left:40px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\">igfxcui            {3AB1675A-CCFF-11D2-8B20-00A0C93CB1F4}</span></span></span></span></div><div style=\"margin-left:40px;\"><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\"><br/></span></span></span></span></div><div>开始菜单所在文件夹</div><div><span style=\"color: rgb(51, 51, 51); font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">        C:\ProgramData\Microsoft\Windows\Start Menu</span></div><div><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\"><br/></span></span></span></span></div><div>添加开机自启软件</div><div>     <span style=\"color: rgb(147, 150, 0);\">第一种方法：</span></div><div>     win+R中打开shell:startup进入</div><div>     C:\Users\Joshion\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup     (因不同电脑而定)</div><div>     将软件快捷方式复制到此文件夹下</div><div>     <span style=\"color: rgb(147, 150, 0);\">第二种方法：</span></div><div>     进入注册列表HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run添加字符值为可执行文件路径的新值</div><div><div style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); font-size: 12px;\"><div>     1.Run键</div></div><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">　　Run键是病毒最青睐的自启动之所，该键位置是[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]和[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]，其下的所有程序在每次启动登录时都会按顺序自动执行。</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">　　还有一个不被注意的Run键，位于注册表[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]和[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run]，也要仔细查看。</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">　　2.RunOnce键</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">　　RunOnce位于[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce]和[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce]键，与Run不同的是，RunOnce下的程序仅会被自动执行一次。</p><p style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">　　3.RunServicesOnce键</p><div style=\"margin: 10px auto; text-indent: 0px; color: rgb(0, 0, 0); font-family: Tahoma; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; text-align: start; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); font-size: 12px;\"><div>　　RunServicesOnce键位于[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce]和[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce]下，其中的程序会在系统加载时自动启动执行一次</div></div></div><div><br/></div><div> </div><div>     </div><div><span style=\"font-size: 16px;\"><span style=\"font-family: &apos;Microsoft Yahei&apos;, 微软雅黑, arial, 宋体, sans-serif;\"><span style=\"background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(51, 51, 51);\"><br/></span></span></span></span></div></span>
</div>
"
);

select * from essay;
delete from essay where number < 100;