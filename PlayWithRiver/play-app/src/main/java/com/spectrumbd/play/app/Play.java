package com.spectrumbd.play.app;

import com.distint.river.base.container.DefaultRiverContainer;
import com.distint.river.base.service.logging.Slf4jLoggingService;
import com.distint.river.core.annotation.RiverInit;
import com.distint.river.core.service.RiverLoggingService;
import com.distint.river.core.service.RiverLoggingService;

/**
 * Created by asif.hasan on 2/22/16.
 */
public class Play {
    @RiverInit
    private static RiverLoggingService riverLoggingService;

    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
