for dir in packages/*
    do
        flutter packages get $dir
    done
flutter pub get