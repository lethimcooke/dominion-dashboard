#!/usr/bin/env python3
"""Local dev server for the Mission Control dashboard (not needed in production)."""
import http.server
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))
http.server.test(HandlerClass=http.server.SimpleHTTPRequestHandler, port=4173, bind="127.0.0.1")
