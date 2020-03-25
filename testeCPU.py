#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Adaptado de :     Pedro Cunial   <pedrocc4@al.insper.edu.br>
#                   Luciano Soares <lpsoares@insper.edu.br>
# Data de criação: 07/2017

######################################################################
# Tools
######################################################################
from os.path import join, dirname
import sys, subprocess
from pathlib import Path

sys.path.insert(0, str(Path.home()) + '/Z01-Tools/scripts/')
from config import *

class tstLab10(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = self.pwd+'/src/'
        self.tst = os.path.join(self.pwd,'tests/')
        self.log = os.path.join(TOOL_PATH,'log','logC.xml')
        self.work = vhdlScript(self.log)

    def addSrc(self, work):
        work.addSrc(self.rtl)

    def addTst(self, work):
        print(self.tst)
        work.addTstConfigFile(self.tst)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

if __name__ == "__main__":

    ## Init ALU
    tstLab10 = tstLab10()
    tstLab10.add(tstLab10.work)
    tstLab10.work.run()

