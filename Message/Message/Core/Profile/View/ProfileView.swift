//
//  ProfileView.swift
//  Message
//
//  Created by Пользователь on 05.04.2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    let user: User
    
    var body: some View {
        VStack{
            PhotosPicker(selection: $viewModel.selectedItem){
                if let profileImage = viewModel.profileImage {
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                }else{
                    CircularProfileImageView_(user: user, size: .xLarge)
                }
            }
            
            Text(user.fullname)
                .font(.title2)
                .fontWeight(.semibold)
            
            List{
                Section{
                    
                    ForEach(SettingOptionViewModel.allCases){ option in
                        HStack{
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                Section{
                    Button("Log Out"){
                        
                    }
                    
                    Button("Delete Account"){
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER)
    }
}
