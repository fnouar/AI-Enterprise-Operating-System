package com.ai_eos.kernel

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class KernelApplication

fun main(args: Array<String>) {
  runApplication<KernelApplication>(*args)
}
