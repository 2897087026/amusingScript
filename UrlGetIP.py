import re
import argparse
from termcolor import cprint
import os

url_file = ""
url_list = []
is_save = False

def run():
    if url_file != "":
        for url in open(url_file, "r", encoding="utf-8"):
            url.replace("\n", "")
            try:
                result = re.search(r"(([01]{0,1}\d{0,1}\d|2[0-4]\d|25[0-5])\.){3}([01]{0,1}\d{0,1}\d|2[0-4]\d|25[0-5])", url)
                url_list.append(result.group())
            except:
                cprint(f"[X] url: {url} 识别错误！", "red")

        cprint(f"[+] IP 列表如下：", "green")
        cprint(f"[+] 总共 {len(tuple(url_list))} 个 IP!", "green")
        for url01 in tuple(url_list):
            cprint(url01, "green")
        cprint("[+] ==============================", "green")

        if is_save:
            for url in tuple(url_list):
                with open("ip.txt", "a+", encoding="utf-8") as f:
                    f.write(url + "\n")
            f.close()
            cprint(f"[+] IP 保存完毕！\n当前路径为：{os.path.join(os.path.abspath(os.curdir), 'ip.txt')}", "green")



if __name__ == '__main__':
    parse = argparse.ArgumentParser("使用说明：\npython UrlGetIP.py -f url.txt -o")
    parse.add_argument("-f", type=str, help="输入 url 地址文件.")
    parse.add_argument("-o", action="store_true", help="是否保存 IP 到文件")

    args = parse.parse_args()

    if args.f != "":
        url_file = args.f

    if args.o:
        is_save = True

    run()