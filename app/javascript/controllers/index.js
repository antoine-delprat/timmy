// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChildviewController from "./childview_controller"
application.register("childview", ChildviewController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MemoryController from "./memory_controller"
application.register("memory", MemoryController)

import MenuController from "./menu_controller"
application.register("menu", MenuController)

import TooltipController from "./tooltip_controller"
application.register("tooltip", TooltipController)
