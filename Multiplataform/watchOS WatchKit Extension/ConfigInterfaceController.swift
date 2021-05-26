//
//  ConfigInterfaceController.swift
//  watchOS WatchKit Extension
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

class ConfigInterfaceController: WKHostingController<ConfigExerciseView> {
    
    override var body: ConfigExerciseView {
        ConfigExerciseView(viewModel: AdjustExerciseViewModel())
    }

}
