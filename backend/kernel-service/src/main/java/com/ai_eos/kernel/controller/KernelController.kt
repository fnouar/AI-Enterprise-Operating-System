package com.ai_eos.kernel.controller

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/kernel/v1")
class KernelController {

  @GetMapping("/health")
  fun health(): ResponseEntity<Map<String, String>> {
    return ResponseEntity.ok(mapOf("status" to "UP"))
  }

  @GetMapping("/status")
  fun status(): ResponseEntity<Map<String, String>> {
    return ResponseEntity.ok(mapOf("kernel" to "running", "version" to "0.1.0"))
  }
}
