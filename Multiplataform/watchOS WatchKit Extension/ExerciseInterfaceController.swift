//
//  ExerciseInterfaceController.swift
//  watchOS WatchKit Extension
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

class ExerciseInterfaceController: WKHostingController<ExerciseViewWatch> {
    
    override var body: ExerciseViewWatch {
        ExerciseViewWatch(viewModel: ExerciseViewModel())
    }

}
