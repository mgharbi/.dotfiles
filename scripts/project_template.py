#!/usr/bin/python

import os, sys, argparse, shutil

class ProjectTemplate(object):
    def __init__(self, type, name):
        self.root     = os.path.join(os.getcwd(),name)
        self.template = os.path.dirname(__file__)
        self.template = os.path.join(self.template,"templates",type)
        if not os.path.exists(self.template):
            raise ValueError("template '%s' unavailable" % self.template)

    def create(self):
        if os.path.exists(self.root):
            print "Path \"%s\" already exists, aborting." % self.root
            return
        for dirpath,dirnames,filenames in os.walk(self.template):
            targetpath = dirpath.replace(self.template, self.root)
            if not os.path.exists(targetpath):
                os.makedirs(targetpath)
            for f in filenames:
                trg = os.path.join(targetpath,f)
                if not os.path.exists(trg):
                    src = os.path.join(dirpath,f)
                    shutil.copy(src,trg)

def main(type, name):
    if len(name) >= 3:
        template = ProjectTemplate(type, name)
        template.create()
    else:
        raise ValueError("invalid project name '%s', should have 3 characters or more" % name)

if __name__ == '__main__':
    # List of available templates
    templates = os.path.join(os.path.dirname(__file__), "templates")
    templates = os.listdir(templates)

    parser = argparse.ArgumentParser()
    parser.add_argument("type", help = "main language of the repo")
    parser.add_argument("name", help = "name of the new project")
    args = parser.parse_args()
    main(args.type, args.name)
